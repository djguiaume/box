.class public Lcom/iclicardeche/music/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/MediaController$MediaPlayerControl;


# instance fields
.field private buttonPlay:Landroid/widget/ImageButton;

.field private buttonStop:Landroid/widget/ImageButton;

.field private controller:Lcom/iclicardeche/music/MusicController;

.field private cursor:Landroid/database/Cursor;

.field private player:Lcom/iclicardeche/music/Player;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 128
    const/4 v0, 0x0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x0

    return v0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    iget-object v0, v0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    return v0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    iget-object v0, v0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    iget-object v0, v0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 98
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->buttonPlay:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    invoke-virtual {v0}, Lcom/iclicardeche/music/Player;->start()V

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->buttonStop:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    if-eqz v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    invoke-virtual {v0}, Lcom/iclicardeche/music/Player;->stop()V

    .line 105
    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/iclicardeche/music/MainActivity;->setContentView(I)V

    .line 41
    const v0, 0x7f080002

    invoke-virtual {p0, v0}, Lcom/iclicardeche/music/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/SeekBar;

    .line 42
    .local v8, seekbar:Landroid/widget/SeekBar;
    const v0, 0x7f080001

    invoke-virtual {p0, v0}, Lcom/iclicardeche/music/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/iclicardeche/music/MainActivity;->buttonPlay:Landroid/widget/ImageButton;

    .line 43
    const/high16 v0, 0x7f08

    invoke-virtual {p0, v0}, Lcom/iclicardeche/music/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/iclicardeche/music/MainActivity;->buttonStop:Landroid/widget/ImageButton;

    .line 45
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->buttonPlay:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    const-string v7, "The Celts"

    .line 48
    .local v7, query:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "content://media/external/audio/search/fancy/"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    invoke-static {v7}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 56
    .local v1, search:Landroid/net/Uri;
    const/4 v0, 0x5

    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v6, v0

    const/4 v0, 0x1

    .line 57
    const-string v3, "mime_type"

    aput-object v3, v6, v0

    const/4 v0, 0x2

    .line 58
    const-string v3, "artist"

    aput-object v3, v6, v0

    const/4 v0, 0x3

    const-string v3, "album"

    aput-object v3, v6, v0

    const/4 v0, 0x4

    .line 59
    const-string v3, "title"

    aput-object v3, v6, v0

    .line 61
    .local v6, projection:[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/iclicardeche/music/MainActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 62
    const-string v5, "title"

    move-object v3, v2

    move-object v4, v2

    .line 61
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/iclicardeche/music/MainActivity;->cursor:Landroid/database/Cursor;

    .line 67
    new-instance v0, Lcom/iclicardeche/music/Player;

    iget-object v2, p0, Lcom/iclicardeche/music/MainActivity;->cursor:Landroid/database/Cursor;

    invoke-virtual {p0}, Lcom/iclicardeche/music/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v2, v3, v8}, Lcom/iclicardeche/music/Player;-><init>(Landroid/database/Cursor;Landroid/content/Context;Landroid/widget/SeekBar;)V

    iput-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    .line 68
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/iclicardeche/music/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f07

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 74
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 92
    iget-object v0, p0, Lcom/iclicardeche/music/MainActivity;->player:Lcom/iclicardeche/music/Player;

    iget-object v0, v0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 93
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 82
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 83
    .local v0, id:I
    const v1, 0x7f080004

    if-ne v0, v1, :cond_0

    .line 84
    const/4 v1, 0x1

    .line 86
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public pause()V
    .locals 0

    .prologue
    .line 159
    return-void
.end method

.method public seekTo(I)V
    .locals 0
    .parameter "pos"

    .prologue
    .line 165
    return-void
.end method

.method public start()V
    .locals 0

    .prologue
    .line 171
    return-void
.end method
