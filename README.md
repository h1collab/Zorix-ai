![Zorix Platform CLI](https://img.shields.io/badge/Zorix-Platform%20CLI-00d4ff?style=flat-square&logo=terminal)
![Version](https://img.shields.io/badge/version-1.0.0-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

# 🚀 Zorix Platform CLI

A powerful, production-grade command-line interface for Zorix AI with interactive chat, web GUI, and enterprise-grade encryption.

**Features:**
- ⚡ Interactive CLI menu with real-time chat
- 🔒 AES-256-GCM encrypted API key storage
- 🎨 Beautiful dark-themed web GUI
- 🧠 Support for multiple AI models
- 🔄 SSE streaming chat responses
- 📦 Native Debian package support
- 🐧 Works on Debian, Ubuntu, Kali Linux, Termux

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [API Configuration](#api-configuration)
- [Models](#models)
- [GUI Usage](#gui-usage)
- [Development](#development)
- [Troubleshooting](#troubleshooting)

## ⚡ Quick Start

**One-line installer:**
```bash
curl -fsSL https://zorix.it/install.sh | sudo bash
```

Or download the `.deb` package:
```bash
wget https://github.com/h1collab/Zorix-ai/releases/download/v1.0.0/zorix-ai.deb
sudo dpkg -i zorix-ai.deb
sudo apt-get install -f
```

**First run:**
```bash
zorix menu
```

## 📦 Installation

### Debian/Ubuntu

**Method 1: Using install script (recommended)**
```bash
curl -fsSL https://zorix.it/install.sh | sudo bash
```

**Method 2: Direct .deb installation**
```bash
sudo apt-get update
sudo apt-get install -y nodejs

wget https://github.com/h1collab/Zorix-ai/releases/download/v1.0.0/zorix-ai.deb
sudo dpkg -i zorix-ai.deb
```

**Method 3: Build from source**
```bash
git clone https://github.com/h1collab/Zorix-ai.git
cd Zorix-ai
npm install
npm run build
sudo npm run build-deb
sudo dpkg -i zorix-ai.deb
```

### Kali Linux
```bash
sudo apt-get update
sudo apt-get install -y nodejs npm
curl -fsSL https://zorix.it/install.sh | sudo bash
```

### Termux (Debian proot)
```bash
pkg install nodejs
pkg install build-essential
npm install -g zorix-platform-cli
```

## 🎯 Usage

### Interactive Menu
```bash
zorix menu
```
Launch the interactive CLI menu with all options.

### Authentication

**Login with API key:**
```bash
zorix login
```

**Renew or update API key:**
```bash
zorix renew
```

**Check authentication status:**
```bash
zorix status
```

### Chat Commands

**Start interactive chat:**
```bash
zorix chat
```

**Send single message:**
```bash
zorix api-req --model model-fast --prompt "Hello world"
```

### Web GUI

**Launch the GUI:**
```bash
zorix gui
```

Opens browser at `http://localhost:3000`

### Model Selection

**List available models:**
```bash
zorix models
```

## 🔐 API Configuration

### Getting Your API Key

1. Visit: https://zorix.it/api-req
2. Sign in with your account
3. Generate a new API key
4. Copy the key (format: `sk-zrx-...`)

### Storing Your Key

Run `zorix login` and follow the prompts:

```bash
$ zorix login

╔════════════════════════════════════════╗
║        ZORIX API KEY LOGIN             ║
╚════════════════════════════════════════╝

Get your API key at: https://zorix.it/api-req

Enter your Zorix API key (sk-zrx-...): ••••••••••••••••••••
Create a secure password (for local encryption): ••••••••
Confirm password: ••••••••
Select default model: 
  1. model-fast (Fastest responses)
  2. model-reason (Balanced)
  3. model-max (Most powerful)
```

Your API key is encrypted locally using **AES-256-GCM** with a password only you know.

## 🧠 Models

### model-fast
- **Speed:** ⚡ Ultra-fast
- **Accuracy:** ★★★☆☆
- **Cost:** 💰 Low
- **Best for:** Quick responses, lightweight tasks

### model-reason
- **Speed:** ⚡⚡ Fast
- **Accuracy:** ★★★★☆
- **Cost:** 💰💰 Medium
- **Best for:** Balanced performance, reasoning tasks

### model-max
- **Speed:** ⚡⚡⚡ Standard
- **Accuracy:** ★★★★★
- **Cost:** 💰💰💰 Premium
- **Best for:** Complex reasoning, detailed responses

## 🎨 GUI Usage

### Access the Web Panel

```bash
zorix gui
```

The GUI features:
- 🎨 Beautiful dark theme
- 💬 Real-time message streaming
- 🔐 Secure authentication
- 📊 API status monitoring
- 🎯 Model selection
- 🔧 Easy configuration

### GUI Features

1. **Chat Interface**
   - Type messages and press Enter
   - Real-time streaming responses
   - Chat history display

2. **Settings Panel**
   - Configure API key
   - Select default model
   - Change encryption password

3. **Status Monitor**
   - Check API key status
   - Monitor model selection
   - View connection status

### Screenshot
```
┌─────────────────────────────────────────────┐
│ 📊 Status        │ 🚀 Zorix Platform GUI   │
├─────────────────┼─────────────────────────┤
│ API Key: ✓      │ [Messages scroll area]  │
│ Model: fast     │                         │
│                 │                         │
│ ⚙️ Settings     │                         │
│ [Configure]     │ You: Hello              │
│                 │                         │
│                 │ Zorix: Hi! How can...  │
│                 │                         │
│                 │ [Input] [Send]          │
└─────────────────┴─────────────────────────┘
```

## 💻 Development

### Project Structure

```
zorix-ai/
├── src/
│   ├── index.js              # Main CLI entry point
│   ├── version.js            # Version info
│   ├── commands/             # CLI commands
│   │   ├── menu.js          # Interactive menu
│   │   ├── login.js         # Authentication
│   │   ├── models.js        # Model listing
│   │   ├── status.js        # Status check
│   │   ├── renew.js         # Key renewal
│   │   ├── chat.js          # Chat session
│   │   ├── gui.js           # GUI launcher
│   │   └── api-req.js       # Direct API requests
│   ├── utils/
│   │   ├── config.js        # Configuration management
│   │   ├── crypto.js        # AES-256-GCM encryption
│   │   └── api.js           # API client
│   └── gui/
│       ├── server.js        # Express/WebSocket server
│       └── public/
│           └── index.html   # Web interface
├── scripts/
│   └── prepare-deb.sh       # Debian packaging
├── package.json
├── install.sh               # Installation script
├── README.md
└── LICENSE
```

### Build Commands

```bash
# Install dependencies
npm install

# Build production bundle
npm run build

# Build Debian package
npm run build-deb

# Clean build artifacts
npm run clean

# Development
npm run dev
```

### Technologies

- **Node.js 16+** - JavaScript runtime
- **Commander** - CLI argument parsing
- **Chalk** - Colored terminal output
- **Inquirer** - Interactive prompts
- **Express** - Web framework
- **WebSocket** - Real-time streaming
- **esbuild** - JavaScript bundler

## 🔧 Troubleshooting

### "Command not found: zorix"

**Solution 1:** Reinstall the package
```bash
sudo dpkg --remove zorix-platform-cli
curl -fsSL https://zorix.it/install.sh | sudo bash
```

**Solution 2:** Manually add to PATH
```bash
sudo ln -sf /usr/bin/zorix /usr/local/bin/zorix
hash -r
```

### "API key validation failed"

- Verify API key format: should start with `sk-zrx-`
- Check internet connection
- Visit https://zorix.it/api-req to generate new key
- Ensure API key hasn't expired

### "Cannot decrypt key without password"

The application needs your encryption password. Set it as environment variable:
```bash
export ZORIX_PASSWORD="your_password"
zorix chat
```

### "Connection refused" on GUI

- Ensure port 3000 is not in use
- Check firewall settings
- Try a different port:
```bash
PORT=3001 zorix gui
```

### Node.js version error

Ensure Node.js 16 or higher is installed:
```bash
node --version  # Should be v16.0.0 or higher
```

Update Node.js:
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## 📚 API Documentation

Full API documentation: https://zorix.it/api-req

### Chat Endpoint

```bash
POST https://os.zorix.it/api/ai/chat

Headers:
  Authorization: Bearer sk-zrx-xxxxx
  Content-Type: application/json

Body:
{
  "model": "model-fast",
  "content": "Your message here"
}

Response (SSE Streaming):
data: {"content":"Hello ","phase":"answer"}
data: {"content":"world","phase":"answer"}
data: [DONE]
```

### Using with curl

```bash
curl -X POST https://os.zorix.it/api/ai/chat \
  -H "Authorization: Bearer sk-zrx-xxxxx" \
  -H "Content-Type: application/json" \
  -d '{"model":"model-fast","content":"Hello"}'
```

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -am 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Issues:** https://github.com/h1collab/Zorix-ai/issues
- **Documentation:** https://zorix.it/api-req
- **Email:** support@zorix.it

## 🎯 Roadmap

- [ ] Python client library
- [ ] Docker support
- [ ] Custom themes
- [ ] Plugin system
- [ ] Conversation history
- [ ] Model fine-tuning
- [ ] Batch processing

## 🌟 Acknowledgments

- Built with [Commander.js](https://github.com/tj/commander.js)
- UI with [Chalk](https://github.com/chalk/chalk)
- Prompts via [Inquirer.js](https://github.com/SBoudrias/Inquirer.js)

---

Made with ❤️ by [h1collab](https://github.com/h1collab)

**Get started:** `curl -fsSL https://zorix.it/install.sh | sudo bash`
