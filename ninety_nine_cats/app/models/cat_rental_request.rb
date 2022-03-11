class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    if self.id
      requests = CatRentalRequest.where("cat_rental_requests.cat_id = ?", self.cat_id)
      .where.not("cat_rental_requests.id = ?", self.id)
    else
      requests = CatRentalRequest.where("cat_rental_requests.cat_id = ?", self.cat_id)
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where('cat_rental_requests.status = ?', 'APPROVED')
  end

  def does_not_overlap_approved_request 
    if overlapping_approved_requests.exists?(['cat_rental_requests.end_date BETWEEN ? AND ? OR cat_rental_requests.start_date BETWEEN ? AND ?', self.start_date, self.end_date, self.start_date, self.end_date])
      errors[:base] << 'The dates requested are not available'
    end
  end

end