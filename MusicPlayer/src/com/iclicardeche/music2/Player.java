package com.iclicardeche.music2;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.provider.BaseColumns;
import android.provider.MediaStore;
import android.provider.MediaStore.Audio.AudioColumns;
import android.provider.MediaStore.Audio.Media;
import android.provider.MediaStore.MediaColumns;
import android.util.Log;
import android.widget.SeekBar;
import java.io.IOException;

public class Player
  implements MediaPlayer.OnPreparedListener, MediaPlayer.OnCompletionListener
{
  private Context context;
  public Cursor cursor;
  public MediaPlayer mediaPlayer;
  private SeekBar seekBar;
  private String[] arrayOfString;

  protected Player(Cursor paramCursor, Context paramContext, SeekBar paramSeekBar)
  {
    this.cursor = paramCursor;
    this.context = paramContext;
    this.seekBar = paramSeekBar;
    this.mediaPlayer = new MediaPlayer();
    this.mediaPlayer.setOnPreparedListener(this);
    this.mediaPlayer.setOnCompletionListener(this);
    int i = 0;

    if ((this.cursor != null) && (this.cursor.moveToFirst()))
    {
      this.cursor.moveToNext();
      String str = this.cursor.getString(this.cursor.getColumnIndex("title"));
      arrayOfString = this.cursor.getColumnNames();
      Log.v("PLAYER", "Display Name: " + str + " lenght = " + arrayOfString.length);
      i = 0;
      
      Uri localUri = null;
      while (i < arrayOfString.length)
      {
        int j = this.cursor.getInt(this.cursor.getColumnIndex("_id"));
        localUri = ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, j);
        Log.v("PLAYER", "songId = " + j + " URI = " + localUri);
        this.mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
        Log.v("NAME", arrayOfString[i]);
        i++;
      }
        try {
			this.mediaPlayer.setDataSource(this.context, localUri);
		} catch (IllegalArgumentException | SecurityException
				| IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        this.mediaPlayer.prepareAsync();
    }

      
        
  }

  private void setSong()
  {
  }

  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    this.mediaPlayer.stop();
    this.mediaPlayer.reset();
    this.cursor.moveToNext();
    Uri localUri = null;
    if (!this.cursor.isAfterLast())
    {
      int i = this.cursor.getInt(this.cursor.getColumnIndex("_id"));
      localUri = ContentUris.withAppendedId(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, i);
    }
    else
    	return;

      try {
		this.mediaPlayer.setDataSource(this.context, localUri);
	} catch (IllegalArgumentException | SecurityException
			| IllegalStateException | IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      this.mediaPlayer.prepareAsync();
      return;

  }

  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    this.mediaPlayer.start();
    new MySeekBar(this.mediaPlayer, this.seekBar);
  }

  public void start()
  {
    if (!this.mediaPlayer.isPlaying())
      this.mediaPlayer.start();
  }

  public void stop()
  {
    if (this.mediaPlayer.isPlaying())
      this.mediaPlayer.stop();
  }
}