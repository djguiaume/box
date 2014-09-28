.class public Lcom/iclicardeche/music/Player;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field private context:Landroid/content/Context;

.field public cursor:Landroid/database/Cursor;

.field public mediaPlayer:Landroid/media/MediaPlayer;

.field private seekBar:Landroid/widget/SeekBar;


# direct methods
.method protected constructor <init>(Landroid/database/Cursor;Landroid/content/Context;Landroid/widget/SeekBar;)V
    .locals 10
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    .line 29
    iput-object p2, p0, Lcom/iclicardeche/music/Player;->context:Landroid/content/Context;

    .line 30
    iput-object p3, p0, Lcom/iclicardeche/music/Player;->seekBar:Landroid/widget/SeekBar;

    .line 31
    new-instance v7, Landroid/media/MediaPlayer;

    invoke-direct {v7}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 32
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v7, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 33
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v7, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 35
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 36
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    .line 37
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    iget-object v8, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    .line 38
    const-string v9, "title"

    invoke-interface {v8, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 37
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 39
    .local v1, displayName:Ljava/lang/String;
    const-string v7, "PLAYER"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Display Name: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v7}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v4

    .line 42
    .local v4, sizeIndex:[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v7, v4

    if-lt v3, v7, :cond_1

    .line 49
    const-string v7, "content://media/external/audio/search/fancy/"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 50
    .local v0, baseUri:Landroid/net/Uri;
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    .line 51
    iget-object v8, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    .line 52
    const-string v9, "_id"

    invoke-interface {v8, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 51
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 54
    .local v5, songId:I
    sget-object v7, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    int-to-long v8, v5

    .line 53
    invoke-static {v7, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 55
    .local v6, songUri:Landroid/net/Uri;
    const-string v7, "PLAYER"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "songId = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " URI = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v8, 0x3

    invoke-virtual {v7, v8}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 58
    :try_start_0
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v8, p0, Lcom/iclicardeche/music/Player;->context:Landroid/content/Context;

    invoke-virtual {v7, v8, v6}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    iget-object v7, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v7}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 67
    .end local v0           #baseUri:Landroid/net/Uri;
    .end local v1           #displayName:Ljava/lang/String;
    .end local v3           #i:I
    .end local v4           #sizeIndex:[Ljava/lang/String;
    .end local v5           #songId:I
    .end local v6           #songUri:Landroid/net/Uri;
    :cond_0
    :goto_1
    return-void

    .line 43
    .restart local v1       #displayName:Ljava/lang/String;
    .restart local v3       #i:I
    .restart local v4       #sizeIndex:[Ljava/lang/String;
    :cond_1
    const-string v7, "NAME"

    aget-object v8, v4, v3

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 60
    .restart local v0       #baseUri:Landroid/net/Uri;
    .restart local v5       #songId:I
    .restart local v6       #songUri:Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 62
    .local v2, e:Ljava/lang/Exception;
    :goto_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 60
    .end local v2           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v2

    goto :goto_2

    :catch_2
    move-exception v2

    goto :goto_2

    :catch_3
    move-exception v2

    goto :goto_2
.end method

.method private setSong()V
    .locals 0

    .prologue
    .line 100
    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 6
    .parameter "arg0"

    .prologue
    .line 77
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->stop()V

    .line 78
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->reset()V

    .line 79
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    .line 80
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_0

    .line 81
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    iget-object v4, p0, Lcom/iclicardeche/music/Player;->cursor:Landroid/database/Cursor;

    .line 82
    const-string v5, "_id"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 81
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 84
    .local v1, songId:I
    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    int-to-long v4, v1

    .line 83
    invoke-static {v3, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 87
    .local v2, songUri:Landroid/net/Uri;
    :try_start_0
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lcom/iclicardeche/music/Player;->context:Landroid/content/Context;

    invoke-virtual {v3, v4, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    iget-object v3, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 95
    .end local v1           #songId:I
    .end local v2           #songUri:Landroid/net/Uri;
    :cond_0
    return-void

    .line 89
    .restart local v1       #songId:I
    .restart local v2       #songUri:Landroid/net/Uri;
    :catch_0
    move-exception v0

    .line 91
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 89
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_1
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .parameter "mp"

    .prologue
    .line 71
    iget-object v1, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 72
    new-instance v0, Lcom/iclicardeche/music/MySeekBar;

    iget-object v1, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/iclicardeche/music/Player;->seekBar:Landroid/widget/SeekBar;

    invoke-direct {v0, v1, v2}, Lcom/iclicardeche/music/MySeekBar;-><init>(Landroid/media/MediaPlayer;Landroid/widget/SeekBar;)V

    .line 73
    .local v0, msb:Lcom/iclicardeche/music/MySeekBar;
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 105
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/iclicardeche/music/Player;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 110
    :cond_0
    return-void
.end method
