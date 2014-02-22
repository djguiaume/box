package com.iclicardeche.dataoperation;

import java.io.File;

import android.content.Intent;
import android.inputmethodservice.InputMethodService;
import android.net.Uri;
import android.os.Environment;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.InputConnection;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.app.Activity;
import android.app.ActivityManager;

import com.iclicardeche.rfidkeyboardcatch.R;
import com.iclicardeche.softkeyboard.SoftKeyboard;

public class AppLauncher {

	public Intent appFromId(String id, String type, String ressource,
			Context context, InputConnection input) {
		Intent intent = new Intent();
		intent.setAction(Intent.ACTION_VIEW);
		Log.v("appFromId", "type ="+type+" ressource ="+ressource );
		if (type.equalsIgnoreCase("video")) {
			intent.setDataAndType(Uri.fromFile(new File(
					Environment.getExternalStorageDirectory() + "/movie/"
							+ ressource)),"video/*");
			intent.setPackage("com.mxtech.videoplayer.ad");
			Log.v("appFromId", "video");
		} else if (type.equalsIgnoreCase("audio")) {
			intent.setDataAndType(Uri.fromFile(new File(
					Environment.getExternalStorageDirectory() + "/music/"
							+ ressource)),"audio/*");
			intent.setPackage("com.maxmpz.audioplayer");
		} else if (type.equalsIgnoreCase("photo")) {
			intent.putExtra(Intent.EXTRA_STREAM, Uri.fromFile(new File(
					Environment.getExternalStorageDirectory() + "/photo/"
							+ ressource)));
			intent.setType("image/*");
		} else if (type.equalsIgnoreCase("clean")) {
			//Activity activity = (Activity) context;
			//View parent = activity.getWindow().getDecorView().findViewById(android.R.id.content);
			/*input.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_HOME));//KEYCODE_MEDIA_CLOSE
			input.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_HOME));//KEYCODE_MEDIA_CLOSE
			input.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_CLOSE));//KEYCODE_MEDIA_CLOSE
			input.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_CLOSE));//KEYCODE_MEDIA_CLOSE*/
			ActivityManager activityManager = (ActivityManager)context.getSystemService(Activity.ACTIVITY_SERVICE);
			activityManager.killBackgroundProcesses("com.maxmpz.audioplayer");
			activityManager.killBackgroundProcesses("com.mxtech.videoplayer.ad");
			return null;
		} else {
			Log.v("appFromId", "PAS SENCER ETRE LA");
			return null;
		}
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		return intent;
	}

}
