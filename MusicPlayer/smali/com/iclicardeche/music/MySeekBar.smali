.class public Lcom/iclicardeche/music/MySeekBar;
.super Ljava/lang/Object;
.source "MySeekBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field mp:Landroid/media/MediaPlayer;

.field progress:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>(Landroid/media/MediaPlayer;Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "mediaPlayer"
    .parameter "seekBar"

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/iclicardeche/music/MySeekBar;->mp:Landroid/media/MediaPlayer;

    .line 14
    iput-object p2, p0, Lcom/iclicardeche/music/MySeekBar;->progress:Landroid/widget/SeekBar;

    .line 15
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 20
    const/4 v0, 0x0

    .line 21
    .local v0, currentPosition:I
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    .line 22
    .local v2, total:I
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->progress:Landroid/widget/SeekBar;

    invoke-virtual {v3, v2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 23
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->mp:Landroid/media/MediaPlayer;

    if-eqz v3, :cond_1

    if-lt v0, v2, :cond_2

    .line 35
    :cond_1
    :goto_1
    return-void

    .line 25
    :cond_2
    const-wide/16 v3, 0x3e8

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 26
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getCurrentPosition()I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 32
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 33
    iget-object v3, p0, Lcom/iclicardeche/music/MySeekBar;->progress:Landroid/widget/SeekBar;

    invoke-virtual {v3, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_0

    .line 27
    :catch_0
    move-exception v1

    .line 28
    .local v1, e:Ljava/lang/InterruptedException;
    goto :goto_1

    .line 29
    .end local v1           #e:Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 30
    .local v1, e:Ljava/lang/Exception;
    goto :goto_1
.end method
