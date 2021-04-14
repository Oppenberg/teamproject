"""This profile allocates two bare metal nodes and connects them directly together via a layer1 link. 

Instructions:
Click on any node in the topology and choose the `shell` menu item. When your shell window appears, use `ping` to test the link."""

# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as pg
# Import the Emulab specific extensions.
import geni.rspec.emulab as emulab

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()

# Do not run snmpit
#request.skipVlans()

# Add a raw PC to the request and give it an interface.
node1 = request.RawPC("node1")
# Must use UBUNTU18 to utilize layer 1 links.
node1.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops//UBUNTU18-64-STD"
iface1 = node1.addInterface()

# Specify the IPv4 address
iface1.addAddress(pg.IPv4Address("192.168.1.1", "255.255.255.0"))

# Add another raw PC to the request and give it an interface.
node2 = request.RawPC("node2")
# Must use UBUNTU18 to utilize layer 1 links.
node2.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops//UBUNTU18-64-STD"
iface2 = node2.addInterface()

# Specify the IPv4 address
iface2.addAddress(pg.IPv4Address("192.168.1.2", "255.255.255.0"))

# Add L1 link from node1 to node2
link1 = request.L1Link("link1")
link1.addInterface(iface1)
link1.addInterface(iface2)

# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
