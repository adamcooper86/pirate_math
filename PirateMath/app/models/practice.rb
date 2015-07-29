class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :facts, through: :questions

  def question_hash
    question_hash = {}
    if self.questions.count > 0

      question = self.questions.last
      question_hash[:previous] = {prompt: "#{question.fact.number_1}+#{question.fact.number_2}", answer: question.fact.solution, student_answer: question.answer}
    end
    question_hash[:next] = create_next_question
    question_hash
  end

  def cumulative_practice_data
    return_data = practice_data
    return_data[:facts] = {}
    self.facts.each do |fact|
      return_data[:facts][fact.id] = Hash.new(0)
      fact.questions.where(practice_id: self.id).each do |question|
        if question.answer == fact.solution
          return_data[:facts][fact.id][:correct] += 1
        else
          return_data[:facts][fact.id][:wrong] += 1
        end
      end
    end
    return_data
  end

  def done?
    self.questions.count > 19
  end

  def create_next_question
    fact = Fact.all.sample
    self.questions.create(fact_id: fact.id)
    {prompt: "#{fact.number_1}+#{fact.number_2}"}
  end

  def practice_data
    hash = Hash.new
    hash[:right] = correct_answers self.questions
    hash[:wrong] = wrong_answers self.questions
    hash
  end

  def correct_answers questions
    questions.select{ |question| question.answer == question.fact.solution }.count
  end

  def wrong_answers questions
    questions.select{ |question| question.answer != question.fact.solution }.count
  end
end
