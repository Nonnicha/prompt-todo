require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "returns http success" do
      get todos_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /todos" do
    it "creates a new todo and redirects" do
      post todos_path, params: { todo: { title: "New test task" } }
      expect(response).to have_http_status(:redirect)
      expect(Todo.count).to eq(1)
      expect(Todo.last.title).to eq("New test task")
    end
  end

  describe "PATCH /todos/:id/toggle" do
    it "toggles the completion status and redirects" do
      todo = Todo.create!(title: "Toggle task", completed: false)
      patch toggle_todo_path(todo)
      expect(response).to have_http_status(:redirect)
      expect(todo.reload.completed).to be(true)
    end
  end

  describe "DELETE /todos/:id" do
    it "deletes the todo and redirects" do
      todo = Todo.create!(title: "Task to delete")
      delete todo_path(todo)
      expect(response).to have_http_status(:redirect)
      expect(Todo.count).to eq(0)
    end
  end
end
