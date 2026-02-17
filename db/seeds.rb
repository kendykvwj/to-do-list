User.find_or_create_by!(email: "admin@admin.com") do |user|
  user.password = "12345678"
  user.role = :admin
end
