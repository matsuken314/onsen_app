crumb :root do
  link "ホーム", root_path
end

crumb :onsens do
  link "サウナ施設一覧", onsens_path
  parent :root
end
crumb :onsen_show do |onsen|
  link onsen.name.to_s, onsen_path(onsen)
  parent :onsens, onsen
end

crumb :user_show do |user|
  link "#{user.name}のマイページ", user_path(user)
  parent :root
end
crumb :user_edit do |user|
  link "プロフィール編集", user
  parent :user_show, user
end

crumb :new_user do
  link "新規登録", new_user_registration_path
  parent :root
end
crumb :login_user do
  link "ログイン", new_user_session_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
