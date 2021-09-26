User.delete_all
User.create([{ name: 'Tarun', email: 'tarun@gmail.com', password: "password", remember_created_at: nil }])

VehicleType.create([{ name: 'Flash' }, { name: 'Optima' }, { name: 'Photon' }, { name: 'Nyx' }, { name: 'Dash' }])

Battery.create([{ name: '25AH', capacity: '25AH' }, { name: '30AH', capacity: '30AH' }])

Color.create([
    { name: 'Matte Red', code: '#B33F40.' },
    { name: 'White', code: '#ffffff' },
    { name: 'Matte Grey', code: '#7B7B7C' },
    { name: 'Cyan', code: '#00FFFF' }
])