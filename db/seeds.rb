# Users
User.create!(name: "Just Looking", email: "just@looking.com", 
            password: "password", password_confirmation: "password", admin: false,
            activated: true, activated_at: Time.zone.now)
            
User.create!(name: "Raider Anveio", email: "raider@raiding.com", 
            password: "password", password_confirmation: "password", admin: true,
            activated: true, activated_at: Time.zone.now, raider: true)

User.create!(name: "Skythan", email: "mamuise@gmail.com", 
            password: "password", password_confirmation: "password", admin: true,
            activated: true, activated_at: Time.zone.now, raider: true)

User.create!(name: "Anveio", email: "ar_thanos@hotmail.com", 
            password: "gold793a", password_confirmation: "gold793a", admin: true,
            activated: true, activated_at: Time.zone.now, raider: true)

User.create!(name: "Pinionz", email: "taliesingaming@gmail.com", 
            password: "password", password_confirmation: "password", admin: true,
            activated: true, activated_at: Time.zone.now, raider: true)