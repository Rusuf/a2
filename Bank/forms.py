from django import forms
from .models import Bank, Branch

class BankForm(forms.ModelForm):
    class Meta:
        model = Bank
        fields = ['name', 'description', 'inst_num', 'swift_code']
        widgets = {
            'name': forms.TextInput(attrs={'maxlength': 200}),
            'description': forms.Textarea(attrs={'maxlength': 200}),
            'inst_num': forms.TextInput(attrs={'maxlength': 200}),
            'swift_code': forms.TextInput(attrs={'maxlength': 200}),
        }

    def clean(self):
        cleaned_data = super().clean()
        for field in self.fields:
            if len(cleaned_data.get(field, '')) > 200:
                self.add_error(field, f"Ensure this value has at most 200 characters (it has {len(cleaned_data[field])}).")

class BranchForm(forms.ModelForm):
    class Meta:
        model = Branch
        fields = ['name', 'transit_num', 'address', 'email', 'capacity']
        widgets = {
            'name': forms.TextInput(attrs={'maxlength': 200}),
            'transit_num': forms.TextInput(attrs={'maxlength': 200}),
            'address': forms.Textarea(attrs={'maxlength': 200}),
            'email': forms.EmailInput(),
        }

    def clean_capacity(self):
        capacity = self.cleaned_data.get('capacity')
        if capacity is not None and capacity < 0:
            raise forms.ValidationError("Ensure this value is greater than or equal to 0.")
        return capacity

    def clean(self):
        cleaned_data = super().clean()
        for field in ['name', 'transit_num', 'address']:
            if len(cleaned_data.get(field, '')) > 200:
                self.add_error(field, f"Ensure this value has at most 200 characters (it has {len(cleaned_data[field])}).")
        return cleaned_data
