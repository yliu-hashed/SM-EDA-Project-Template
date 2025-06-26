
# Scrap-Mechanic-EDA Project Template

This template allows anyone to create complex Scrap Mechanic circuits using [Scrap-Mechanic-EDA](https://github.com/yliu-hashed/Scrap-Mechanic-EDA) right now, right here, on GitHub. Using GitHub Actions, you can use SM-EDA tools and Yosys without installing them.

This template is very similar to [Example-2 in Scrap-Mechanic-EDA](https://github.com/yliu-hashed/Scrap-Mechanic-EDA/blob/main/Resources/Example-2/GUIDE.md). You can reference that guide for detailed explanations on how SE-EDA, Yosys, and Makefile work.

# Using this Template

This section will guide you through setting up a Project with Scrap-Mechanic-EDA on GitHub.

## 1. Create Your Project Repository

- Click the **"Use this template"** button on the main page of this repository.
- Follow the prompts to create your copy of the project under your GitHub account.

## 2. Add or Edit Your Design

- Navigate to the [src/top.v](src/top.v) file in your new repository.
- Edit it to define your custom circuit using Verilog.
- You can add additional source files in the [src/](src/) directory if needed.

## 3. Compile Your Design

- Go to the **"Actions"** tab in your newly created repository.
- Select the **"Compile and Generate"** workflow from the sidebar.
- This triggers the [compile-and-generate.yml](.github/workflows/compile-and-generate.yml) workflow.
- Click the **"Run workflow"** button.
- Wait for the workflow to complete. You may need to refresh the page for the newly triggered workflow to show up.
- You can always recompile when necessary.

### Troubleshooting

- If the workflow fails, check the logs in the Actions tab for error messages.
- Ensure your Verilog code under the [src/](src/) directory is syntactically correct.
- Ensure the placement config [resources/config.json](resources/config.json) contains all the ports of [src/top.v](src/top.v).
- For more help, see [Scrap-Mechanic-EDA](https://github.com/yliu-hashed/Scrap-Mechanic-EDA).
- If you are certain that something has failed because of an error in SM-EDA or this template, file a bug report.

## 4. Download the Results

- Once the workflow finishes, click on the completed workflow run.
- Then, in the **"Artifacts"** section, download the generated zip named `package-debug.zip` files, which should include compiled blueprints, logs, and reports.
- When the workflow cannot build the design, the Artifacts may still be produced, containing partial results that may aid in debugging.
- This file is only kept by GitHub for up to 90 days.

## 5. (Optional) Customize Configuration

- Edit the [resources/config.json](resources/config.json) to adjust placement layout of the final blueprint.
- Edit the [Makefile](Makefile) to ajust the build process.
