import discord
import asyncio
import datetime
import random
import os
import time
client = discord.Client()

@client.event
async def on_message(message):
    if message.author.bot:
        return

    global voich
    # voice = await join_voice_channel(client.get_channel())
    if message.content == ("///rubi start"):
        voich = await discord.VoiceChannel.connect(message.author.voice.channel)
        t = random.choice(('music.mp3','music2.mp3','music3.mp3'))
        #print(t)
        voich.play(discord.FFmpegPCMAudio(t))
        sleep_time = 62
        await asyncio.sleep(sleep_time)
        await voich.disconnect()

client.run("")