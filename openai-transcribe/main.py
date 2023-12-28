import argparse
from pathlib import Path

from openai import OpenAI

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("audio_file_path", type=Path)
    args = parser.parse_args()

    client = OpenAI()
    with open(args.audio_file_path, "rb") as fb:
        transcript = client.audio.transcriptions.create(
            model="whisper-1", file=fb
        )
    print(transcript.text)
