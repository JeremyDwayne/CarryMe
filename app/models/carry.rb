class Carry < ApplicationRecord
  belongs_to :user
  enum carry_type: [ :key, :raid, :pvp ]
  validates :carry_type, inclusion: { in: Carry.carry_types, message: "%{value} must be assigned" }

  def self.search(search, columns = nil)
    if search.present?
      columns ||= self.column_names.reject{|e| e.end_with?("_id")} - ["id", "created_at", "updated_at"]
      params = {}
      sql = []

      search.split(' ').each_with_index do |s, i|
        params["nth#{i}".to_sym] = "%#{sanitize_sql(s)}%"

        statements = []
        for column in columns
          if column == "carry_type"
            statements << "#{column} = #{Carry.carry_types[sanitize_sql(s)]}" 
          end
          statements << "UPPER(CAST(#{column} AS text)) LIKE UPPER(:nth#{i})"
        end

        sql << "(#{statements.join(" OR ")})"
      end
      self.where(sql.join(" AND "), params)
    else
      self.all``
    end
  end
end
