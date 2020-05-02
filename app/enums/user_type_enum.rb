# include UserTypeEnum
module UserTypeEnum
  extend Enumerize

  STUDENT   = 100
  TEACHER   = 200

  enumerize :user_type,
            in: {
              student:  STUDENT,
              teacher:  TEACHER
            },
            predicates: { prefix: true },
            scope: true,
            default: :student,
            i18n_scope: ['enums.user_type']
end