class IndividualCall < ApplicationRecord
  belongs_to :ExamResult
  belongs_to :Professional
  belongs_to :Participant
  belongs_to :CollectiveActivitySheet
  belongs_to :Exam
  belongs_to :Medicine
  belongs_to :Forwarding
  belongs_to :ExamResult
end
