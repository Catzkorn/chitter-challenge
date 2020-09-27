require "message_manager"

describe MessageManager do
  let(:time_double) { double :time, strftime: "2020-01-01T00:00:00.000+0000" }
  let(:message_double) { double :message, content: "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.", time: time_double }
  let(:time_double_two) { double :time, strftime: "2020-01-01T00:01:00.000+0000" }
  let(:message_double_two) { double :message, content: "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?", time: time_double_two }
  let(:time_double_three) { double :time, strftime: "2020-01-01T00:02:00.000+0000" }
  let(:message_double_three) { double :message, content: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently.", time: time_double_three }

  describe "#store and #all" do
    it "returns all stored messages" do
      clear_database_table()
      MessageManager.store(message_double)
      MessageManager.store(message_double_two)
      MessageManager.store(message_double_three)
      expect(MessageManager.all[0].content).to include("If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently.")
      expect(MessageManager.all[0].time).to eq ("2020-01-01 00:02:00+00")
      expect(MessageManager.all[1].content).to include("If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?")
      expect(MessageManager.all[1].time).to eq ("2020-01-01 00:01:00+00")
      expect(MessageManager.all[2].content).to include("Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend.")
      expect(MessageManager.all[2].time).to eq ("2020-01-01 00:00:00+00")
    end
  end
end
