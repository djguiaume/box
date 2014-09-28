package com.iclicardeche.music2;

import com.iclicardeche.music2.R;

import android.app.Activity;
import android.app.SearchManager;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.MediaController.MediaPlayerControl;
import android.widget.SeekBar;

public class MainActivity extends Activity implements View.OnClickListener,
		MediaPlayerControl {
	private ImageButton buttonPlay;
	private ImageButton buttonStop;
	private MusicController controller;
	private Cursor cursor;
	private Player player;

	public boolean canPause() {
		return false;
	}

	public boolean canSeekBackward() {
		return false;
	}

	public boolean canSeekForward() {
		return false;
	}

	public int getAudioSessionId() {
		return 0;
	}

	public int getBufferPercentage() {
		return 0;
	}

	public int getCurrentPosition() {
		return this.player.mediaPlayer.getCurrentPosition();
	}

	public int getDuration() {
		return this.player.mediaPlayer.getDuration();
	}

	public boolean isPlaying() {
		return this.player.mediaPlayer.isPlaying();
	}

	public void onClick(View paramView) {
		if (paramView.equals(this.buttonPlay))
			this.player.start();
		if ((paramView.equals(this.buttonStop)) && (this.player != null))
			this.player.stop();
	}

	protected void onCreate(Bundle paramBundle) {

		super.onCreate(paramBundle);
		setContentView(R.layout.activity_main);
		SeekBar localSeekBar = (SeekBar) findViewById(R.id.seekBar1);
		this.buttonPlay = ((ImageButton) findViewById(R.id.imageButton1));
		this.buttonStop = ((ImageButton) findViewById(R.id.imageButton2));
		this.buttonPlay.setOnClickListener(this);
		Uri localUri = Uri.parse("content://media/external/audio/search/fancy/"
				+ Uri.encode("Voyageur"));

		Intent intent = this.getIntent();
		if (intent.getAction().compareTo(
				MediaStore.INTENT_ACTION_MEDIA_PLAY_FROM_SEARCH) == 0) {

			String mediaFocus = intent
					.getStringExtra(MediaStore.EXTRA_MEDIA_FOCUS);
			String query = intent.getStringExtra(SearchManager.QUERY);

			// Some of these extras may not be available depending on the search
			// mode
			String album = intent.getStringExtra(MediaStore.EXTRA_MEDIA_ALBUM);
			String artist = intent
					.getStringExtra(MediaStore.EXTRA_MEDIA_ARTIST);
			String genre = intent.getStringExtra("android.intent.extra.genre");
			String playlist = intent
					.getStringExtra("android.intent.extra.playlist");
			String title = intent.getStringExtra(MediaStore.EXTRA_MEDIA_TITLE);

			// Determine the search mode and use the corresponding extras
			if (mediaFocus.compareTo(MediaStore.Audio.Albums.ENTRY_CONTENT_TYPE) == 0) {
				// 'Album' search mode
				localUri = Uri
						.parse("content://media/external/audio/search/fancy/"
								+ Uri.encode(album));

			}
		}
		// String[] all = new String[] { "_id", "mime_type", "artist", "album",
		// "title" };
		this.cursor = getContentResolver().query(localUri, null, null, null,
				"title");
		this.player = new Player(this.cursor, getApplicationContext(),
				localSeekBar);
	}

	public boolean onCreateOptionsMenu(Menu paramMenu) {
		getMenuInflater().inflate(R.menu.main, paramMenu);
		return true;
	}

	public void onDestroy() {
		this.cursor.close();
		this.player.cursor.close();
	}

	public boolean onOptionsItemSelected(MenuItem paramMenuItem) {
		// if (paramMenuItem.getItemId() == )
		// return true;
		return super.onOptionsItemSelected(paramMenuItem);
	}

	public void pause() {
	}

	public void seekTo(int paramInt) {
	}

	public void start() {
	}
}

/*
 * Location: /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name: com.iclicardeche.music.MainActivity JD-Core Version: 0.6.2
 */