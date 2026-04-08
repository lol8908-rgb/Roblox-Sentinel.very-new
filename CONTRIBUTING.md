# Contributing to Roblox Sentinel

First off, thanks for taking the time to contribute! 🎉

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](). By participating, you are expected to uphold this code.

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps which reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed after following the steps**
* **Explain which behavior you expected to see instead and why**
* **Include screenshots and animated GIFs if possible**
* **Include your environment**: Python version, OS, Discord configuration

### 💡 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title**
* **Provide a step-by-step description of the suggested enhancement**
* **Provide specific examples to demonstrate the steps**
* **Describe the current behavior and expected behavior**
* **Explain why this enhancement would be useful**

### 📝 Pull Requests

* Fill in the required template
* Follow the Python styleguides
* Include appropriate test cases
* End all files with a newline

## Development Setup

1. **Fork** the repository
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Roblox-Sentinel.very-new.git
   cd Roblox-Sentinel.very-new
   ```

3. **Create a virtual environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

4. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

5. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

6. **Make your changes** and test them:
   ```bash
   python sentinel.py
   ```

7. **Commit your changes**:
   ```bash
   git commit -m "Add your commit message"
   ```

8. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

9. **Create a Pull Request** to the main repository

## Styleguides

### Python Styleguide

* Use **4 spaces** for indentation
* Follow **PEP 8** naming conventions
* Add **docstrings** to all functions
* Use **type hints** where possible
* Keep lines **under 100 characters** when reasonable

```python
def example_function(param1: str, param2: int) -> bool:
    """
    Brief description of what the function does.
    
    Args:
        param1: Description of param1
        param2: Description of param2
        
    Returns:
        Description of return value
    """
    return True
```

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
  - 🎨 for improvements to structure/format
  - 🚀 for new features
  - 🐛 for bug fixes
  - 📚 for documentation
  - 🧪 for tests
  - 🔒 for security improvements

### Example Commit Messages
```
🚀 Add auto-session switching feature
🐛 Fix Discord webhook timeout issue
📚 Update README with troubleshooting section
🔒 Add environment variable support for webhook URL
```

## Additional Notes

### Issue and Pull Request Labels

* `bug` — Something isn't working
* `enhancement` — New feature or request
* `documentation` — Improvements or additions to documentation
* `good first issue` — Good for newcomers
* `help wanted` — Extra attention is needed
* `question` — Further information is requested

## Recognition

Contributors will be recognized in the README file and CHANGELOG.

Thank you for contributing! 🙏
