package android.support.v4.media;

import android.view.KeyEvent;

abstract interface TransportMediatorCallback
{
  public abstract long getPlaybackPosition();

  public abstract void handleAudioFocusChange(int paramInt);

  public abstract void handleKey(KeyEvent paramKeyEvent);

  public abstract void playbackPositionUpdate(long paramLong);
}

/* Location:           /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.media.TransportMediatorCallback
 * JD-Core Version:    0.6.2
 */