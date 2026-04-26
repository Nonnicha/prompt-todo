# Enterprise Todo List

Welcome to the **Enterprise Todo List**! This application is built as a foundation highlighting top-tier engineering practices. It utilizes a Ruby on Rails backend with Hotwire (Turbo + Stimulus) running standard browser-based UI rendering.

It is heavily designed to enforce:
- **Clean Code** & Avoidance of Code Smell
- **SOLID / DRY / YAGNI** principles
- **TDD (Test Driven Development)** & **BDD (Behavior Driven Development)**
- **ATDD (Acceptance Test-Driven Development)** via System testing.

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- **Ruby** (Reference the `.ruby-version` file for the exact required version)
- **Bundler**
- **SQLite3**

### Local Setup

To run this application locally, follow these steps:

1. **Clone the repository** and navigate to the project directory:
   ```bash
   git clone https://github.com/Nonnicha/prompt-todo.git
   cd todo_enterprise
   ```

2. **Install Ruby dependencies**:
   ```bash
   bundle install
   ```

3. **Setup the Database**:
   This will create the SQLite database and run the initial schema migrations.
   ```bash
   bin/rails db:setup
   ```
   *(Running tests later will automatically prepare the test database: `bin/rails db:test:prepare`)*

4. **Start the Development Server**:
   We recommend using the provided `dev` script to ensure you're watching for CSS/JS changes if needed.
   ```bash
   bin/dev
   ```
   
Your application will be available at [http://localhost:3000](http://localhost:3000).

---

## 🧪 Testing Guide

We take Quality Assurance very seriously. The project incorporates tools strictly built for TDD & ATDD.

### 1. Unit & Request Specifications (TDD / BDD)
Our unit, helper, and request tests are driven by RSpec.
To run the standard RSpec suite:
```bash
bundle exec rspec
```

### 2. System Testing (ATDD / E2E tests)
Our system tests simulate real-world usage and use Capybara. 
Our tests in `spec/system` are driven by Chrome. 

> **Important**: You must have `chromedriver` installed to run the browser-based tests locally (e.g. `brew install --cask chromedriver` for Mac).

To test the application flow in an actual browser:
```bash
bundle exec rspec spec/system/todos_spec.rb
```

### 3. Static Code Analysis (Clean Code)
We enforce stylistic choices and look for code smells using **RuboCop**.
Run static analysis against the codebase before pushing code:
```bash
bundle exec rubocop
```
_Note: We use `rubocop-rspec` to verify test smells alongside standard ruby smells._

---

## 📱 Mobile Preview (Ngrok)
This application has been explicitly configured in develop mode to clear host constraints so it can be previewed via local tunnel proxies.

If you wish to test the UI on a mobile device:
1. Ensure your Rails server is running (`bin/dev`).
2. In a separate terminal, expose port 3000:
   ```bash
   ngrok http 3000
   ```
3. Open the "Forwarding" `https://<identifier>.ngrok-free.app` URL provided by ngrok on your mobile browser.

---
