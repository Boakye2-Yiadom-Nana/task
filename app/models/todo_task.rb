class TodoTask < ApplicationRecord
    has_many_attached :attachments
    belongs_to :category, optional: true
    belongs_to :category, optional: true
    validates :title, presence: true, length: { maximum: 100}
    validates :description, presence:true, length: { maximum: 1000}
    validates :due_date, presence: true
    validates :status, presence: true, inclusion: { in: ['pending', 'in-progress', 'completed']}
    
    validate :due_date_cannot_be_in_the_past
    
    STATUSES = %w[pending in-progress completed]
    PRIORITIES = %w[low medium high].freeze
    validates :priority, inclusion: { in: PRIORITIES }, allow_blank: true
  
   scope :overdue, -> { where("due_date < ? AND (completed IS NULL OR completed = ?)", Time.current, false) }
   scope :due_within_days, ->(days) { where(due_date: Time.current..Time.current + days.days) }
   scope :completed, -> { where(completed: true) }
   scope :pending, -> { where(completed: [false, nil]) }
   scope :by_priority, ->(p) { where(priority: p) if p.present? }   
    private

    def due_date_cannot_be_in_the_past
        if due_date.present? && due_date < Date.current
            errors.add(:due_date, "can't be in the past")
        end
    end

end
