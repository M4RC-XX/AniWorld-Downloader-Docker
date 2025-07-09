<a id="readme-top"></a>
# AniWorld Downloader for Docker

AniWorld Downloader is a versatile command-line tool designed for downloading and streaming anime, series, and movies. It supports Windows, macOS, and Linux, offering a seamless experience across platforms.

![Downloads](https://img.shields.io/pypi/dm/aniworld?label=Downloads&color=blue)
![License](https://img.shields.io/pypi/l/aniworld?label=License&color=blue)

![AniWorld Downloader - Demo](https://github.com/m4rc-xx/AniWorld-Downloader-Docker/blob/next/.github/assets/demo_docker2.png?raw=true)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Features

- **Download Episodes or Seasons**: Effortlessly download individual episodes or entire seasons with a single command.
- **Stream Instantly**: Watch episodes directly using the integrated mpv player for a seamless experience.
- **Auto-Next Playback**: Enjoy uninterrupted viewing with automatic transitions to the next episode.
- **Multiple Providers**: Access a variety of streaming providers on aniworld.to for greater flexibility.
- **Language Preferences**: Easily switch between German Dub, English Sub, or German Sub to suit your needs.
- **Aniskip Support**: Automatically skip intros and outros for a smoother viewing experience.
- **Group Watching with Syncplay**: Host synchronized anime sessions with friends using Syncplay integration.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Supported Providers

To see the list of supported providers, check the [SUPPORTED_PROVIDERS](https://github.com/phoenixthrush/AniWorld-Downloader/blob/dfbe431cb9bfbb315e22185b5cb63e06e7cd6277/src/aniworld/config.py#L100C11-L102C) variable.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation

### Prerequisites

Ensure you have **[Docker](https://docs.docker.com/get-started/)** and **[Docker Compose](https://docs.docker.com/compose/)**.<br>
Additionally, you can use **[Portainer](https://docs.portainer.io/start/install-ce)** to deploy your **compose** as a stack.

### Docker-Compose

```yaml
services:
  aniworld-downloader:
    image: ghcr.io/m4rc-xx/aniworld-downloader-docker:next
    container_name: aniworld-downloader
    tty: true
    stdin_open: true
    volumes:
      - <PATH-FOR-DOWNLOADS>:/app/downloads
     #EXAMPLE
     #- /home/pi/aniworld-downloads:/app/downloads
    restart: unless-stopped
```



<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

AniWorld Downloader offers three versatile usage modes:

1. **Interactive Menu**: Launch the tool and navigate through an intuitive menu to select and manage downloads or streams.
2. **Command-Line Arguments**: Execute specific tasks directly by providing arguments, such as downloading a particular episode or setting preferences.

Choose the method that best suits your workflow and enjoy a seamless experience!

to execute into the container
```shell
docker exec -it aniworld-downloader /bin/bash
```

### Menu Example

To start the interactive menu, simply run:

```shell
aniworld --output-dir /app/downloads
```

### Command-Line Arguments Example

AniWorld Downloader provides a variety of command-line options for downloading and streaming anime without relying on the interactive menu. These options unlock advanced features such as `--aniskip`, `--keep-watching`, and `--syncplay-password`.

#### Example 1: Download a Single Episode

To download episode 1 of "Demon Slayer: Kimetsu no Yaiba":

```shell
aniworld --output-dir /app/downloads --episode https://aniworld.to/anime/stream/demon-slayer-kimetsu-no-yaiba/staffel-1/episode-1
```

#### Example 2: Download Multiple Episodes

To download multiple episodes of "Demon Slayer":

```shell
aniworld --output-dir /app/downloads --episode https://aniworld.to/anime/stream/demon-slayer-kimetsu-no-yaiba/staffel-1/episode-1 https://aniworld.to/anime/stream/demon-slayer-kimetsu-no-yaiba/staffel-1/episode-2
```

#### \~~~Example 3: Watch Episodes with Aniskip\~~~

#### \~~~Example 4: Syncplay with Friends\~~~

#### Example 5: Download with Specific Provider and Language

To download an episode using the VOE provider with English subtitles:

```shell
aniworld --output-dir /app/downloads --episode https://aniworld.to/anime/stream/demon-slayer-kimetsu-no-yaiba/staffel-1/episode-1 --provider VOE --language "English Sub"
```

#### Example 6: Use an Episode File

You can download episodes listed in a text file. Below is an example of a text file (`test.txt`):

```
# The whole anime
https://aniworld.to/anime/stream/alya-sometimes-hides-her-feelings-in-russian

# The whole Season 2
https://aniworld.to/anime/stream/demon-slayer-kimetsu-no-yaiba/staffel-2

# Only Season 3 Episode 13
https://aniworld.to/anime/stream/kaguya-sama-love-is-war/staffel-3/episode-13
```

To download the episodes specified in the file, use:

```shell
aniworld --output-dir /app/downloads --episode-file test.txt --language "German Dub"
```

\~~~This can also be combined with `Watch` and `Syncplay` actions, as well as other arguments, for a more customized experience.~~~

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Dependencies

AniWorld Downloader depends on the following Python packages:

- **`requests`**: For handling HTTP requests.
- **`beautifulsoup4`**: For parsing and scraping HTML content.
- **`yt-dlp`**: For downloading videos from supported providers.
- **`npyscreen`**: For creating interactive terminal-based user interfaces.
- **`tqdm`**: For providing progress bars during downloads.
- **`fake_useragent`**: For generating random user-agent strings.
- **`packaging`**: For parsing version numbers and handling package versions.
- **`jsbeautifier`**: Used for the Filemoon extractor.
- **`py-cpuinfo`**: Only required on Windows for gathering CPU information (AVX2 support for MPV).
- **`windows-curses`**: Required on Windows systems to enable terminal-based UI functionality.

These dependencies are automatically installed when you set up AniWorld Downloader.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Credits

- **[phoenixthrush](https://github.com/phoenixthrush)**: for this amazing project <3.
- **[mpv](https://github.com/mpv-player/mpv.git)**: A versatile media player used for seamless streaming.
- **[yt-dlp](https://github.com/yt-dlp/yt-dlp.git)**: A powerful tool for downloading videos from various providers.
- **[Syncplay](https://github.com/Syncplay/syncplay.git)**: Enables synchronized playback sessions with friends.
- **[Anime4K](https://github.com/bloc97/Anime4K)**: A cutting-edge real-time upscaler for enhancing anime video quality.
- **[Aniskip](https://api.aniskip.com/api-docs)**: Provides the opening and ending skip times for the Aniskip extension.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

Contributions to AniWorld Downloader are highly appreciated! You can help enhance the project by:

- **Reporting Bugs**: Identify and report issues to improve functionality.
- **Suggesting Features**: Share ideas to expand the tool's capabilities.
- **Submitting Pull Requests**: Contribute code to fix bugs or add new features.

### Contributors

<a href="https://github.com/phoenixthrush/Aniworld-Downloader/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=phoenixthrush/Aniworld-Downloader" alt="Contributors" />
</a>

- **Lulu** (since Sep 14, 2024)  
  ![Wakatime Badge](https://wakatime.com/badge/user/ebc8f6ad-7a1c-4f3a-ad43-cc402feab5fc/project/408bbea7-23d0-4d6c-846d-79628e6b136c.svg)

- **Tmaster055** (since Oct 21, 2024)  
  ![Wakatime Badge](https://wakatime.com/badge/user/79a1926c-65a1-4f1c-baf3-368712ebbf97/project/5f191c34-1ee2-4850-95c3-8d85d516c449.svg)

  Special thanks to [Tmaster055](https://github.com/Tmaster055) for resolving the Aniskip issue by correctly fetching the MAL ID!  
  Additional thanks to [fundyjo](https://github.com/fundyjo) for contributing the Doodstream extractor!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Support

If you need help with AniWorld Downloader, you can:

- **Submit an issue** on the [GitHub Issues](https://github.com/phoenixthrush/AniWorld-Downloader/issues) page.
- **Reach out directly** via email at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) or on Discord at `phoenixthrush`.

While email support is available, opening a GitHub issue is preferred, even for installation-related questions, as it helps others benefit from shared solutions. However, feel free to email if that’s your preference.

If you find AniWorld Downloader useful, consider starring the repository on GitHub. Your support is greatly appreciated and inspires continued development.

Thank you for using AniWorld Downloader!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Legal Disclaimer

AniWorld Downloader is made for accessing content that’s already publicly available online. It doesn’t support or promote piracy or copyright violations. The developer isn’t responsible for how the tool is used or for any content found through external links.

All content accessed with AniWorld Downloader is available on the internet, and the tool itself doesn’t host or share copyrighted files. It also has no control over the accuracy, legality, or availability of the websites it links to.

If you have concerns about any content accessed through this tool, please reach out directly to the website’s owner, admin, or hosting provider. Thanks for your understanding.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Star History of the main project

[![Star History Chart](https://api.star-history.com/svg?repos=phoenixthrush/Aniworld-Downloader&type=Date)](https://star-history.com/#phoenixthrush/Aniworld-Downloader&Date)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

This project is licensed under the **[MIT License](LICENSE)**.  
For more details, see the LICENSE file.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
