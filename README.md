# 📋 Task Tracker

A modern, full-featured task management application built with Ruby on Rails 8. Features a beautiful dark-themed UI with Kanban-style task boards, real-time updates, and team collaboration tools.

![Task Tracker Banner](https://via.placeholder.com/1200x400/1f2937/fbbf24?text=Task+Tracker+-+Modern+Project+Management)

## ✨ Features

### 🎯 Kanban Board
Drag-and-drop task management with four customizable columns: To Do, In Progress, Review, and Done.

![Kanban Board](https://via.placeholder.com/800x500/1f2937/3b82f6?text=Kanban+Board+with+Drag+and+Drop)

### 📁 Project Management
- Create and manage multiple projects
- Add team members to projects
- Track project progress with visual stats
- Organize tasks within project context

![Project List](https://via.placeholder.com/800x500/1f2937/fbbf24?text=Project+Dashboard)

### ✅ Task Management
- Create, edit, and delete tasks
- Set priority levels (Low, Medium, High)
- Assign due dates and track overdue tasks
- Assign tasks to team members
- Add labels for categorization

![Task Details](https://via.placeholder.com/800x500/1f2937/22c55e?text=Task+Details+Page)

### 💬 Comments & Collaboration
- Add comments to tasks
- Real-time updates via Turbo Streams
- Activity tracking with Paper Trail

### 👥 Team Collaboration
- Invite team members to projects
- Role-based access control with CanCanCan
- User search functionality

![Team Members](https://via.placeholder.com/800x400/1f2937/8b5cf6?text=Team+Collaboration)

### 🔐 Authentication & Authorization
- Secure user authentication with Devise
- Role management with Rolify
- Permission-based access control

### 📱 Responsive Design
- Fully responsive dark-themed UI
- Mobile-friendly navigation
- Smooth animations and transitions

![Mobile View](https://via.placeholder.com/400x700/1f2937/fbbf24?text=Mobile+Responsive)

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| **Backend** | Ruby on Rails 8.1 |
| **Database** | SQLite (development), PostgreSQL (production) |
| **Frontend** | Tailwind CSS, Hotwire (Turbo + Stimulus) |
| **Authentication** | Devise |
| **Authorization** | CanCanCan + Rolify |
| **Real-time** | Turbo Streams + Solid Cable |
| **Background Jobs** | Solid Queue |
| **Deployment** | Kamal + Docker |

## 📦 Gems Used

- **[Devise](https://github.com/heartcombo/devise)** - Authentication solution
- **[CanCanCan](https://github.com/CanCanCommunity/cancancan)** - Authorization library
- **[Rolify](https://github.com/RolifyCommunity/rolify)** - Role management
- **[Paranoia](https://github.com/rubysherpas/paranoia)** - Soft deletes
- **[PaperTrail](https://github.com/paper-trail-gem/paper_trail)** - Version tracking
- **[Tailwind CSS Rails](https://github.com/rails/tailwindcss-rails)** - CSS framework
- **[Turbo Rails](https://github.com/hotwired/turbo-rails)** - Real-time updates
- **[Stimulus Rails](https://github.com/hotwired/stimulus-rails)** - JavaScript framework

## 🚀 Getting Started

### Prerequisites

- Ruby 3.4+
- Rails 8.1+
- Node.js (for Tailwind CSS)
- SQLite (development) or PostgreSQL (production)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/task_tracker.git
   cd task_tracker
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   bin/rails db:create db:migrate db:seed
   ```

4. **Build CSS assets**
   ```bash
   bin/rails tailwindcss:build
   ```

5. **Start the server**
   ```bash
   bin/rails server
   ```

6. **Visit the app**
   Open your browser and navigate to `http://localhost:3000`

### Development Mode

For development with live CSS reload:

```bash
bin/dev
```

This starts both the Rails server and Tailwind CSS watcher.

## 📖 Usage Guide

### Creating Your First Project

1. Click the **"New Project"** button on the dashboard
2. Enter a project name and description
3. Click **"Create Project"**

![New Project Form](https://via.placeholder.com/600x400/1f2937/fbbf24?text=Create+New+Project)

### Adding Tasks

1. Navigate to your project
2. Click **"New Task"**
3. Fill in the task details:
   - Title (required)
   - Description
   - Status (To Do, In Progress, Review, Done)
   - Priority (Low, Medium, High)
   - Due Date
   - Assignee
4. Click **"Create Task"**

![New Task Form](https://via.placeholder.com/600x500/1f2937/3b82f6?text=Create+New+Task)

### Using the Kanban Board

- **Drag and drop** tasks between columns to update their status
- **Click on a task** to view its details
- The dashboard shows all tasks assigned to you

### Managing Team Members

1. Go to your project page
2. In the sidebar, use the search box to find users by email
3. Click on a user to add them to the project

![Add Member](https://via.placeholder.com/400x300/1f2937/8b5cf6?text=Add+Team+Members)

## 🔌 API Endpoints

The application provides a JSON API for integration:

### Projects API

```
GET /api/v1/projects    # List all projects
```

### Tasks API

```
GET /api/v1/tasks       # List all tasks
```

## 🧪 Running Tests

```bash
bin/rails test
bin/rails test:system
```

## 🔒 Security Features

- **Soft Deletes** - Data is never permanently deleted
- **Version History** - Track all changes with Paper Trail
- **CSRF Protection** - Built-in Rails security
- **XSS Protection** - Automatic output escaping
- **SQL Injection Prevention** - Parameterized queries

## 📁 Project Structure

```
task_tracker/
├── app/
│   ├── controllers/
│   │   ├── api/v1/          # API controllers
│   │   └── concerns/
│   ├── models/              # ActiveRecord models
│   ├── views/               # ERB templates
│   ├── javascript/          # Stimulus controllers
│   └── jobs/                # Background jobs
├── config/
│   ├── routes.rb            # Application routes
│   └── database.yml         # Database configuration
├── db/
│   ├── migrate/             # Database migrations
│   └── schema.rb            # Current database schema
├── lib/
└── public/
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Ruby on Rails](https://rubyonrails.org/) - The web framework
- [Tailwind CSS](https://tailwindcss.com/) - For the beautiful UI
- [Hotwire](https://hotwired.dev/) - For real-time features
- [SortableJS](https://sortablejs.github.io/Sortable/) - For drag-and-drop functionality

---

<p align="center">
  Built with ❤️ using Ruby on Rails
</p>
