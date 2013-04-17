# Custom Fact to pull Room from computer name

Facter.add("room") do
    setcode do
        name = Facter.value('hostname')
        arrHostName = name.split('-')

        strRoom = arrHostName[1]

        if strRoom.is_a? Integer
            strRoom
        else
            strRoom
        end
    end
end
