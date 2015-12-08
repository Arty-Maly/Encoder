# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


message_list = []

usr = User.create!(email: 'drugdev@drugdev.com',
			 password: '123',
			 password_hash: BCrypt::Engine.hash_secret('123', BCrypt::Engine.generate_salt))
usr.message.create!(m_message: 'Q(Iu(bpm(Lm#mtwxmz(gw"(Izm(Twwsqvo(Nwz666',
					m_offset: "8",)

usr.message.create!(m_message: %Q|es$s2s#.s0*2*s v2# xw2 *2# "w2s2t&/2&x2uz&u&#s+w*RS%v2&%#02s2vw-w#&'w)2# "w2$w2us%2$s"w2s##2+zw2uz&u&#s+w*2*.ww+|,
					m_offset: "18",)

usr.message.create!(m_message: %Q|;KQW?=JdPWD=J
HAWPDAWPNQPDi"#J
WPD=PWEOWSDUWUKQWJAA
W=W
ARAHKLANWHEGAWIA|,
					m_offset: "-30",)

usr.message.create!(m_message: %Q|Upup-!J(wf!b!gffmjoh!xf(sf!opu!xsjujoh!dpef!boz!npsf///|,
					m_offset: "-84",)