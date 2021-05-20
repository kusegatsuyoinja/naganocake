class Genre < ApplicationRecord
   validates :name, presence: true
   
   enum genre:{
     ケーキ: 0,
     プリン: 1,
     焼き菓子: 2,
     キャンディ: 3
   }
end