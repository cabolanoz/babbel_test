def normalize(data)

    data.keys.reduce({}) do |acc, fullname|
      email = data[fullname].strip
      acc[email.split('@').last] = {fullname:fullname, email:email, type:EmailHelper.get_type(fullname, email)}
      acc
    end
end

@@MOCK_DATA = normalize({
"John Doe" => " jdoe@babbel.com ",
"Arun Jay" => " jayarun@linkedin.com ",
"David Stein" => " davidstein@google.com ",
"Mat Lee" => " matlee@google.com ",
"Marta Dahl" => " mdahl@babbel.com ",
"Vanessa Boom" => " vboom@babbel.com "
})
