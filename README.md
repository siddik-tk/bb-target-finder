# BB Target Finder

A lightweight bug bounty recon workflow that quickly collects fresh bounty target domains and filters live targets using `httpx`.

## What It Does

This script:

* Pulls the latest updates from `bounty-targets-data`
* Extracts the latest 100 target domains ('100' is because each new programs can contain 50+ domains or assets)
* Runs `httpx` to identify live domains
* Stores live recon-ready targets automatically

## Tools Used

* Bash
* Git
* httpx
* bounty-targets-data

## Installation

Clone this repository:

```bash
git clone https://github.com/siddik-tk/bb-target-finder.git
cd bb-target-finder
```

Clone the target dataset:

```bash
git clone https://github.com/arkadiyt/bounty-targets-data.git ~/BB-Recon/bounty-targets-data
```

Install `httpx`:

```bash
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
```

## Usage

Make the script executable:

```bash
chmod +x auto_recon.sh
```

Run the script:

```bash
./auto_recon.sh
```

## Output Files

### `new_targets.txt`

Contains the latest selected target domains.

### `live_targets.txt`

Contains live targets filtered using `httpx`.

## Example Workflow

```text
git pull
    ↓
extract latest targets
    ↓
httpx live filtering
    ↓
recon-ready domains
```

## Example Output

```text
https://api.toom.de
https://dojo-yeswehack.com
https://ywh.api.zecible.fr
```

## Disclaimer

This project is intended for educational and authorized security research purposes only.

Always follow bug bounty program scope and platform rules.

## Credits

Target dataset:
https://github.com/arkadiyt/bounty-targets-data
