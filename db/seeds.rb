unless Deity.exists?
  Deity.create!(
    name: '大麻比古神',
    name_hiragana: 'おおあさひこかみ'
  )

  Deity.create!(
    name: '猿田彦神',
    name_hiragana: 'さるたひこのかみ'
  )

  Deity.create!(
    name: '大山祇神',
    name_hiragana: 'おおやまつみのかみ'
  )

  Deity.create!(
    name: '味鋤高彦根神',
    name_hiragana: 'あじすきたかひこねのかみ'
  )

  Deity.create!(
    name: '一言主神',
    name_hiragana: 'ひとことぬしのかみ'
  )

  Deity.create!(
    name: '倭迹迹日百襲姫命',
    name_hiragana: 'やまとととひももそひめのみこと'
  )

  Deity.create!(
    name: '五十狭芹彦命',
    name_hiragana: 'いさせりひこのみこと'
  )

  Deity.create!(
    name: '天隠山命',
    name_hiragana: 'あめのかぐやまのみこと'
  )

  Deity.create!(
    name: '天五田根命',
    name_hiragana: 'あめのいたねのみこと'
  )
end

unless Shrine.exists?
  Shrine.create!(
    name: '大麻比古神社',
    name_hiragana: 'おおあさひこじんじゃ',
    address: '徳島県鳴門市大麻町板東字広塚１３',
    hp: 'http://www.ooasahikojinja.jp/',
    deities: [Deity.find_by(name: '大麻比古神'), Deity.find_by(name: '猿田彦神')]
  )

  Shrine.create!(
    name: '大山祇神社',
    name_hiragana: 'おおやまづみじんじゃ' ,
    address: '愛媛県今治市大三島町宮浦3327番地',
    deities: [Deity.find_by(name: '大山祇神')]
  )

  Shrine.create!(
    name: '土佐神社',
    name_hiragana: 'とさじんじゃ',
    address: '高知県高知市しなね2丁目16-1',
    hp: 'http://www.tosajinja.i-tosa.com',
    deities: [Deity.find_by(name: '味鋤高彦根神'), Deity.find_by(name: '一言主神')]
  )

  Shrine.create!(
    name: '田村神社',
    name_hiragana: 'たむらじんじゃ',
    address: '香川県高松市一宮町字宮東286番地',
    hp: 'http://tamurajinja.com/',
    deities: [
      Deity.find_by(name: '倭迹迹日百襲姫命'), Deity.find_by(name: '五十狭芹彦命'), Deity.find_by(name: '猿田彦神'),
      Deity.find_by(name: '天隠山命'), Deity.find_by(name: '天五田根命')
    ]
  )
end
