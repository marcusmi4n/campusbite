// screens/auth_screen.dart
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CampusBite',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: 'Sign Up'), Tab(text: 'Login')],
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [SignUpScreen(), LoginScreen()],
      ),
    );
  }
}

// screens/signup_screen.dart
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Create an account',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome friend, enter your details so lets get started in ordering food.',
            style: GoogleFonts.poppins(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildTextField('Student Number', 'Enter student number'),
          const SizedBox(height: 15),
          _buildTextField('Password', 'Enter password', isPassword: true),
          const SizedBox(height: 15),
          _buildTextField(
            'Confirm Password',
            'Confirm password',
            isPassword: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'or',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            icon: Image.asset('assets/google.png', height: 24),
            label: Text('Sign-in with Google', style: GoogleFonts.poppins()),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Already have an account? Login',
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

// screens/login_screen.dart
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Login to your account',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Good to see you again, enter your details below to continue ordering.',
            style: GoogleFonts.poppins(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildTextField('Student Number', 'Enter Student Number'),
          const SizedBox(height: 15),
          _buildTextField('Password', 'Enter password', isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen(),
                    ),
                  ),
              child: Text('Forgot Password?', style: GoogleFonts.poppins()),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text(
                'Log In',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'or',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            icon: Image.asset('assets/google.png', height: 24),
            label: Text('Sign-in with Google', style: GoogleFonts.poppins()),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Don\'t have an account? Create An Account',
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

// screens/forgot_password_screen.dart
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password', style: GoogleFonts.poppins()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Enter your email address to request a password reset.',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildTextField('Student Number', 'Enter Student Number'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: Image.asset('assets/google.png', height: 24),
              label: Text('Sign-in with Google', style: GoogleFonts.poppins()),
              onPressed: () {},
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Remember password? Login',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
