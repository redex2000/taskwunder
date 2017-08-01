# Create admin user
User.create_with(password: '12345678', password_confirmation: '12345678', bio: 'Bio', full_name: 'Admin', birth_date: Date.today, admin: true)
  .find_or_create_by email: 'admin@profport.ru'