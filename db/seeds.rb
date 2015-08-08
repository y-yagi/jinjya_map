unless Deity.exists?
  Deity.create!(
    name: '大麻比古神',
    name_hiragana: 'おおあさひこかみ'
  )

  Deity.create!(
    name: '猿田彦神',
    name_hiragana: 'さるたひこのかみ'
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
end
