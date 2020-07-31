import discord
import asyncio
import datetime
import random
import os
client = discord.Client()

@client.event
async def on_message(message):
    if message.author.bot:
        return

    voice = await.join_voice_channel(client.get_channel())
    if message.content == ("///rubi start")
        t = random.choice('music.mp3', 'music2.mp3','music3.mp3')
        player = await voice.create_ffmpeg_player(t)
        player.start()

client.run(os.environ['RUBITYAN_T'])