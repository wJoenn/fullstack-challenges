SUFFIXES = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

def louchebemize(sentence)
  # TODO: implement your louchebem translator
  array = sentence.split(/\b/)

  array.map! do |element|
    if (i = element.index(/[aeiou]/)) && element.length > 1
      "l#{element.chars.last(element.length - i).push(element.chars.first(i), SUFFIXES.sample).join}"
    else
      element
    end
  end.join
end
