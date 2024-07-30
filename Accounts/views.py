from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserProfileForm
from django.contrib import messages

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Account created for {username}!')
            return redirect('login')
    else:
        form = UserRegisterForm()
    return render(request, 'Accounts/register.html', {'form': form})

@login_required
def profile(request):
    if request.method == 'POST':
        u_form = UserProfileForm(request.POST, instance=request.user.userprofile)
        if u_form.is_valid():
            u_form.save()
            messages.success(request, f'Your profile has been updated!')
            return redirect('profile')
    else:
        u_form = UserProfileForm(instance=request.user.userprofile)

    context = {
        'u_form': u_form
    }    

    return render(request, 'accounts/profile.html', context)

def home(request):
    return render(request, 'accounts/home.html')