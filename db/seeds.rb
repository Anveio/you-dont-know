# Users
User.create!(name: "Just Looking", email: "just@looking.com", 
            password: "password", password_confirmation: "password", admin: false,
            activated: true, activated_at: Time.zone.now)
            
User.create!(name: "Raider Anveio", email: "raider@raiding.com", 
            password: "password", password_confirmation: "password", admin: true,
            activated: true, activated_at: Time.zone.now, raider: true)

