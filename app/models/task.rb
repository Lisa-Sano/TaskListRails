class Task < ActiveRecord::Base
  belongs_to :person

  def self.search(search)
      search = search.gsub(/[^A-Za-z0-9]/, '')
      where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end


  def self.incomplete_tasks(id)
    where(person_id: id).where(completed_at: nil)
  end

  def self.complete_tasks(id)
    where(person_id: id).where.not(completed_at: nil)
  end

end

