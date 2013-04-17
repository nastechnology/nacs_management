# Custom Fact to pull building from computer name

Facter.add("building") do
    setcode do
        name = Facter.value('hostname')
        arrHostName = name.split('-')

        strBuilding = arrHostName[0]
        strBuilding
    end
end
