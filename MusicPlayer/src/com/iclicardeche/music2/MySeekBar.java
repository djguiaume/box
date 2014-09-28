package com.iclicardeche.music2;

import android.media.MediaPlayer;
import android.widget.SeekBar;

public class MySeekBar
  implements Runnable
{
  MediaPlayer mp;
  SeekBar progress;

  public MySeekBar(MediaPlayer paramMediaPlayer, SeekBar paramSeekBar)
  {
    this.mp = paramMediaPlayer;
    this.progress = paramSeekBar;
  }

  public void run()
  {
    int i = 0;
    int j = this.mp.getDuration();
    this.progress.setMax(j);
    while (true)
    {
      if ((this.mp == null) || (i >= j))
        return;
      try
      {
        Thread.sleep(1000);
        int k = this.mp.getCurrentPosition();
        i = k;
        if (this.mp.isPlaying())
          this.progress.setProgress(i);
      }
      catch (InterruptedException localInterruptedException)
      {
      }
      catch (Exception localException)
      {
      }
    }
  }
}

/* Location:           /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name:     com.iclicardeche.music.MySeekBar
 * JD-Core Version:    0.6.2
 */