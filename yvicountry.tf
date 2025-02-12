/*variable "countries" {
  description = "A map of country names and their citizen"
  type        = map(string)
  default = {
    "Canada"     = "canadian"
    "Haiti"      = "Haitian"
    "Russia"     = "Russian"
    "China"      = "Chinese"
  }
}
output "country_upper" {
  description = "Convert Country name to uppercase"
  value       = upper("Haiti")
}
output "country_lower" {
  description = "Convert country name to lowercase"
  value       = lower("China")
}
output "country_replace" {
  description = "Replace 'Russia' with 'United States'"
  value       = replace("Russia", "Russia", "United States")
}
output "restaurant_substring" {
  description = "Extract first 4 letters from Bouillon Bilk"
  value       = substr("Bouillon Bilk", 0, 4)
}
output "restaurant_join" {
  description = "Join restaurant names with commas"
  value       = join(", ", ["Joe Beef", "Schwartz's", "La Banquise", "Bouillon Bilk"])
}
output "formatted_restaurant" {
  description = "Format restaurant name by replacing, uppercasing, and extracting substring"
  value       = substr(upper(replace("La Banquise", "La ", "")), 0, 5)
}*/
