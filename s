[1mdiff --git a/app/controllers/tasks_controller.rb b/app/controllers/tasks_controller.rb[m
[1mindex 1bb555f..889be47 100644[m
[1m--- a/app/controllers/tasks_controller.rb[m
[1m+++ b/app/controllers/tasks_controller.rb[m
[36m@@ -1,10 +1,11 @@[m
 class TasksController < ApplicationController[m
[32m+[m[32m    before_action :set_task, only: [:show, :edit, :update, :destroy][m
[32m+[m[41m    [m
     def index[m
         @tasks = Task.all[m
     end [m
     [m
     def show[m
[31m-        @task = Task.find(params[:id])[m
     end [m
     [m
     def new[m
[36m@@ -24,12 +25,9 @@[m [mclass TasksController < ApplicationController[m
     end [m
     [m
     def edit[m
[31m-        @task = Task.find(params[:id])[m
     end [m
     [m
     def update[m
[31m-        @task = Task.find(params[:id])[m
[31m-[m
         if @task.update(task_params)[m
             flash[:success] = 'Task は正常に更新されました'[m
             redirect_to @task[m
[36m@@ -40,7 +38,6 @@[m [mclass TasksController < ApplicationController[m
     end [m
     [m
     def destroy[m
[31m-      @task = Task.find(params[:id])[m
       @task.destroy[m
 [m
       flash[:success] = 'Task は正常に削除されました'[m
[1mdiff --git a/app/views/tasks/edit.html.erb b/app/views/tasks/edit.html.erb[m
[1mindex 9aed9ae..47a7103 100644[m
[1m--- a/app/views/tasks/edit.html.erb[m
[1m+++ b/app/views/tasks/edit.html.erb[m
[36m@@ -2,17 +2,7 @@[m
 <%= @task.id %>[m
 のタスク編集ページ</h1>[m
 [m
[31m-<%= form_with(model: @task, local: true) do |f| %>[m
[31m-[m
[31m-<%= f.label :content, 'タスク' %>[m
[31m-[m
[31m-<%= f.text_field :content %>[m
[31m-[m
[31m-[m
[31m-<%= f.submit '投稿' %>[m
[31m-[m
[31m-<% end %>[m
[31m-[m
[32m+[m[32m<%= render 'form', task: @task %>[m
 [m
 <%= link_to '一覧に戻る', tasks_path %>[m
 [m
[1mdiff --git a/app/views/tasks/new.html.erb b/app/views/tasks/new.html.erb[m
[1mindex 6c46ecc..8292170 100644[m
[1m--- a/app/views/tasks/new.html.erb[m
[1m+++ b/app/views/tasks/new.html.erb[m
[36m@@ -1,18 +1,6 @@[m
 <h1>タスク新規作成ページ</h1>[m
 [m
[31m-<%= form_with(model: @task, local: true) do |f| %>[m
[31m-[m
[31m-  [m
[31m-<%= f.label :content, 'タスク' %>[m
[31m-[m
[31m-  [m
[31m-<%= f.text_field :content %>[m
[31m-[m
[31m-[m
[31m-  [m
[31m-<%= f.submit '投稿' %>[m
[31m-[m
[31m-<% end %>[m
[32m+[m[32m<%= render 'form', task: @task %>[m
 [m
 [m
 <%= link_to '一覧に戻る', tasks_path %>[m
