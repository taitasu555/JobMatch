 user = User.new(
name: "admin",
email: 'admin@example.com', 
password: 'admin@example.com', 
password_confirmation: 'admin@example.com'
)
user.save!


user = User.new(
   name: "リクルーター",
   email: 'aaa@example.com', 
   password: 'aaa@example.com', 
   password_confirmation: 'aaa@example.com'
 )

user.save!
 user = User.new(
  name: "就活生",
  email: 'bbb@example.com', 
  password: 'bbb@example.com', 
  password_confirmation: 'bbb@example.com'
 )
 user.save!


Tag.create([
  { tag_name: 'Executive ' },
  { tag_name: 'IT (PC, Web, Unix)' },
   { tag_name: 'Electronics (Appliance/Semiconductor) '},
   { tag_name: 'IT (Embedded Software, Control Systems) '},
   { tag_name: 'IT (Other) '},
   { tag_name: 'Electronics (Appliance/Semiconductor) '},
  { tag_name: 'Manufacturing (Automobile/Plant Engineering/Precision Equipment)'},
  { tag_name: 'Medical/Pharmaceutical/Bio/Fabric/Food'},
  { tag_name: 'Building/Construction/Equipment/Real Estate '},
  { tag_name: 'Consulting'},
  { tag_name: 'General Affairs/HR/Legal'},
  { tag_name: 'Legal'},
  { tag_name: 'Finance/Accounting'},
  { tag_name: 'Administrative'},
  { tag_name: 'Customer Service'},
  { tag_name: 'Finance/Bank/Securities'},
  { tag_name: 'Insurance'},
  { tag_name: 'Property/Real Estate'},
  { tag_name: 'Other Financial Specialist'},
  { tag_name: 'Sales/AE'},
  { tag_name: 'Marketing/PR'},
  { tag_name: 'Logistics/Retail/Consumer/Fashion'},
  { tag_name: 'Hospitality Business Specialists'},
  { tag_name: 'Education/Training/Language Specialist'},
  { tag_name: 'Creative(Internet Related) '},
  { tag_name: 'Health/Nursing '},
  { tag_name: 'Government/Public Sector'},
  { tag_name: 'Other Job Type '},
  ])

