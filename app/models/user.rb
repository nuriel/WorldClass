# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  ouid                   :integer
#  is_teacher             :boolean
#  ip                     :string(255)
#  os                     :string(255)
#  status                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lat                    :string(255)
#  lng                    :string(255)
#  image                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :remember_me, :lat, :lng, :image, :ip
  # attr_accessible :title, :body

  has_many :teaching_classrooms, class_name: "Classroom", foreign_key: "teacher_id"
  has_many :questions
  has_many :answers

  has_and_belongs_to_many :classrooms

  has_many :evaluations, class_name: "ReputationSystem::Evaluation", as: :source

  scope :teachers, -> { where is_teacher: true}

  has_reputation :karma,
                 :source => [
                     { :reputation => :questioning_skill, :weight => 0.8 },
                     { :reputation => :answering_skill }]

  has_reputation :questioning_skill,
                 :source => { :reputation => :votes, :of => :questions }

  has_reputation :answering_skill,
                 :source => { :reputation => :avg_rating, :of => :answers }

  validate :name, presence: true

  def voted_for?(object)
    evaluations.where(target_type: object.class, target_id: object.id).present?
  end

  def name
    super || "firstly"
  end

  def to_s
    name
  end
end
