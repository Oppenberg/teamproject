  
"""An example of constructing a profile with install and execute services. 
Instructions:
Wait for the profile instance to start, then click on the node in the topology
and choose the `shell` menu item. The install and execute services are handled
automatically during profile instantiation, with no manual intervention required.
"""

# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as rspec

# Create a Request object to start building the RSpec.
request = portal.context.makeRequestRSpec()
 
# Add a raw PC to the request.
node = request.RawPC("node")

# Request that a specific image be installed on this node
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops//UBUNTU20-64-STD";

# Install and execute scripts on the node. 
node.addService(rspec.Execute(shell="sh", command="sudo bash /local/repository/install_docker.sh")) # Installs docker
portal.context.printRequestRSpec()
