package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;

class NotificationCompatGingerbread
{
  public static Notification add(Notification paramNotification, Context paramContext, CharSequence paramCharSequence1, CharSequence paramCharSequence2, PendingIntent paramPendingIntent1, PendingIntent paramPendingIntent2)
  {
    paramNotification.setLatestEventInfo(paramContext, paramCharSequence1, paramCharSequence2, paramPendingIntent1);
    paramNotification.fullScreenIntent = paramPendingIntent2;
    return paramNotification;
  }
}

/* Location:           /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.app.NotificationCompatGingerbread
 * JD-Core Version:    0.6.2
 */