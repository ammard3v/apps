import 'package:apitut/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String loginRoute = '/';
  static const String dashboardRoute = '/dashboard';
  static const String ssidListRoute = '/ssidList';
  static const String ssidConfigRoute = '/ssidConfig';
  static const String connectedDevicesRoute = '/connectedDevices';
  static const String deviceDetailsRoute = '/deviceDetails';
  static const String complaintListRoute = '/complaintList';
  static const String newComplaintRoute = '/newComplaint';
  static const String complaintDetailsRoute = '/complaintDetails';
  static const String settingsRoute = '/settings';
  static const String passwordResetRoute = '/passwordReset';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => LoginScreen(),
        dashboardRoute: (context) => DashboardScreen(),
        ssidListRoute: (context) => SSIDListScreen(),
        ssidConfigRoute: (context) => SSIDConfigurationScreen(),
        connectedDevicesRoute: (context) => ConnectedDevicesListScreen(),
        deviceDetailsRoute: (context) => DeviceDetailsScreen(),
        complaintListRoute: (context) => ComplaintListScreen(),
        newComplaintRoute: (context) => NewComplaintFormScreen(),
        complaintDetailsRoute: (context) => ComplaintDetailsScreen(),
        settingsRoute: (context) => SettingsScreen(),
        passwordResetRoute: (context) => PasswordResetScreen(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  Widget _navButton(BuildContext context, String title, String route) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Network Management',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('SSID List'),
              onTap: () => Navigator.pushNamed(context, MyApp.ssidListRoute),
            ),
            ListTile(
              title: Text('Connected Devices'),
              onTap: () =>
                  Navigator.pushNamed(context, MyApp.connectedDevicesRoute),
            ),
            ListTile(
              title: Text('Complaints'),
              onTap: () =>
                  Navigator.pushNamed(context, MyApp.complaintListRoute),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () => Navigator.pushNamed(context, MyApp.settingsRoute),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, MyApp.loginRoute);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Welcome to the Network Management Dashboard',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            _navButton(context, 'SSID List', MyApp.ssidListRoute),
            _navButton(
                context, 'Connected Devices List', MyApp.connectedDevicesRoute),
            _navButton(context, 'Complaint List', MyApp.complaintListRoute),
            _navButton(context, 'Settings', MyApp.settingsRoute),
          ],
        ),
      ),
    );
  }
}

class SSIDListScreen extends StatelessWidget {
  final List<String> ssids = [
    'SSID_1',
    'SSID_2',
    'SSID_3',
    'Guest_Network',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SSID List'),
      ),
      body: ListView.builder(
        itemCount: ssids.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ssids[index]),
            trailing: Icon(Icons.settings),
            onTap: () {
              Navigator.pushNamed(context, MyApp.ssidConfigRoute,
                  arguments: ssids[index]);
            },
          );
        },
      ),
    );
  }
}

class SSIDConfigurationScreen extends StatefulWidget {
  @override
  _SSIDConfigurationScreenState createState() =>
      _SSIDConfigurationScreenState();
}

class _SSIDConfigurationScreenState extends State<SSIDConfigurationScreen> {
  String ssidName = '';
  bool isVisible = true;
  String securityType = 'WPA2';
  final List<String> securityOptions = ['None', 'WEP', 'WPA', 'WPA2'];

  @override
  Widget build(BuildContext context) {
    final String? arg = ModalRoute.of(context)?.settings.arguments as String?;
    if (arg != null && ssidName.isEmpty) {
      ssidName = arg;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SSID Configuration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ssidName.isEmpty
            ? Text('No SSID selected.')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Configure SSID: $ssidName',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  SwitchListTile(
                    title: Text('Visible to public'),
                    value: isVisible,
                    onChanged: (val) {
                      setState(() {
                        isVisible = val;
                      });
                    },
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Security Type'),
                    value: securityType,
                    items: securityOptions.map((sec) {
                      return DropdownMenuItem(
                        value: sec,
                        child: Text(sec),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        if (val != null) securityType = val;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Save action placeholder
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('SSID configuration saved')),
                      );
                    },
                    child: Text('Save Configuration'),
                  ),
                ],
              ),
      ),
    );
  }
}

class ConnectedDevicesListScreen extends StatelessWidget {
  final List<Map<String, String>> devices = [
    {'name': 'John\'s Laptop', 'ip': '192.168.1.102'},
    {'name': 'Smartphone', 'ip': '192.168.1.103'},
    {'name': 'Printer', 'ip': '192.168.1.104'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connected Devices'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          var device = devices[index];
          return ListTile(
            title: Text(device['name']!),
            subtitle: Text('IP: ${device['ip']}'),
            trailing: Icon(Icons.info_outline),
            onTap: () {
              Navigator.pushNamed(context, MyApp.deviceDetailsRoute,
                  arguments: device);
            },
          );
        },
      ),
    );
  }
}

class DeviceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? device =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Device Details'),
      ),
      body: device == null
          ? Center(child: Text('No device selected.'))
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${device['name']}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('IP Address: ${device['ip']}'),
                  SizedBox(height: 10),
                  Text('Device Type: Laptop'), // placeholder
                  SizedBox(height: 10),
                  Text('Manufacturer: Generic'), // placeholder
                  SizedBox(height: 10),
                  Text('Data Usage: 1.2 GB'), // placeholder
                ],
              ),
            ),
    );
  }
}

class ComplaintListScreen extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {'id': '1', 'title': 'Slow internet', 'status': 'Open'},
    {'id': '2', 'title': 'WiFi drops frequently', 'status': 'In Progress'},
    {
      'id': '3',
      'title': 'Unable to connect to guest network',
      'status': 'Resolved'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'New Complaint',
            onPressed: () {
              Navigator.pushNamed(context, MyApp.newComplaintRoute);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          var complaint = complaints[index];
          return ListTile(
            title: Text(complaint['title']!),
            subtitle: Text('Status: ${complaint['status']}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, MyApp.complaintDetailsRoute,
                  arguments: complaint);
            },
          );
        },
      ),
    );
  }
}

class NewComplaintFormScreen extends StatefulWidget {
  @override
  _NewComplaintFormScreenState createState() => _NewComplaintFormScreenState();
}

class _NewComplaintFormScreenState extends State<NewComplaintFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _urgency = 'Low';

  final List<String> urgencyOptions = ['Low', 'Medium', 'High'];

  void _submitComplaint() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Normally handle form submission here
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Complaint submitted')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Complaint'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Enter complaint title' : null,
                onSaved: (val) => _title = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: (val) => val == null || val.isEmpty
                    ? 'Enter complaint description'
                    : null,
                onSaved: (val) => _description = val ?? '',
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Urgency'),
                value: _urgency,
                items: urgencyOptions.map((urg) {
                  return DropdownMenuItem(
                    value: urg,
                    child: Text(urg),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    if (val != null) _urgency = val;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitComplaint,
                child: Text('Submit Complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComplaintDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? complaint =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Details'),
      ),
      body: complaint == null
          ? Center(child: Text('No complaint selected.'))
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${complaint['title']}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Status: ${complaint['status']}'),
                  SizedBox(height: 10),
                  Text(
                      'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder to mark complaint as resolved
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Status updated')));
                    },
                    child: Text('Mark as Resolved'),
                  ),
                ],
              ),
            ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Do you really want to logout?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, MyApp.loginRoute);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              Navigator.pushNamed(context, MyApp.passwordResetRoute);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }
}

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void _submitReset() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Normally trigger password reset email here
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset link sent to $_email')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Enter your email to receive a password reset link.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(val)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (val) => _email = val ?? '',
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitReset,
                child: Text('Send Reset Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
