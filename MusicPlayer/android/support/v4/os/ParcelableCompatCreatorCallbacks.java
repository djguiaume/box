package android.support.v4.os;

import android.os.Parcel;

public abstract interface ParcelableCompatCreatorCallbacks<T>
{
  public abstract T createFromParcel(Parcel paramParcel, ClassLoader paramClassLoader);

  public abstract T[] newArray(int paramInt);
}

/* Location:           /home/galan_g/Dev/box/music/dex2jar-0.0.9.15/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.os.ParcelableCompatCreatorCallbacks
 * JD-Core Version:    0.6.2
 */