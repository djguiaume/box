package android.support.v4.content;

import android.content.ComponentName;
import android.content.Intent;

class IntentCompatHoneycomb
{
  public static Intent makeMainActivity(ComponentName paramComponentName)
  {
    return Intent.makeMainActivity(paramComponentName);
  }

  public static Intent makeRestartActivityTask(ComponentName paramComponentName)
  {
    return Intent.makeRestartActivityTask(paramComponentName);
  }
}

/* Location:           /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.content.IntentCompatHoneycomb
 * JD-Core Version:    0.6.2
 */