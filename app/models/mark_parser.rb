module MarkParser
  # TODO: Implement multi country grading system using range value/key grade hash

  def self.parse(mark)
    case mark
    when 70..100 then	'A'
    when 65..69	then 'A-'
    when 60..64	then 'B+'
    when 50..59	then 'B'
    when 45..49	then 'C+'
    when 40..44	then 'C'
    when 0..39 then 'F'
    end
  end
end
