User.delete_all
User.create([{ name: 'Tarun', email: 'tarun@gmail.com', password: "password", remember_created_at: nil }])

VehicleType.create([{ name: 'Flash' }, { name: 'Optima' }, { name: 'Photon' }, { name: 'Nyx' }, { name: 'Dash' }])