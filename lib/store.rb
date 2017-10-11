class Store < ActiveRecord::Base
    has_many :employees
    validates :name, length: { minimum: 3 }
    validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validate :must_have_men_or_womens_apparel

    def must_have_men_or_womens_apparel
        if (!(mens_apparel || womens_apparel))
            errors.add(:mens_apparel, "Must have at least a mens_apparel or womens_apparel")
            errors.add(:womens_apparel, "Must have at least a mens_apparel or womens_apparel")
        end
    end
end
